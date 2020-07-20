/*--------------------------------------------------------------------*/
/* symtablehash.c                                                     */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#include "symtable.h"
#include <stdlib.h>
#include <assert.h>
#include <string.h>

/* enumerate the bucket counts of the hash table */
enum BUCKET_COUNT{THRESHOLD1 = 509, THRESHOLD2 = 1021,
                  THRESHOLD3 = 2039, THRESHOLD4 = 4093,
                  THRESHOLD5 = 8191, THRESHOLD6 = 16381,
                  THRESHOLD7 = 32749, THRESHOLD8 = 65521};

/* A hash function returning a size_t signifying the correct index of 
   a binding in the hash table based off its key pcKey and the number of 
   buckets uBucketCount in the array. */

static size_t SymTable_hash(const char *pcKey, size_t uBucketCount);

/* returns a size_t representing the new size of the expanded hash
   table array. If the return value is equal to uBucketCount */

static size_t SymTable_newSize(size_t uBucketCount);

/* Each binding is stored in a SymbolTableBinding. SymbolTableBindings
   are linked to form a bucket. */

struct SymbolTableBinding
{
   /* string that uniquely identifies its binding */
   const char *key;
   /* data that is pertinent to its key */
   void *value;
   /* pointer to the next node in the list */
   struct SymbolTableBinding *next;
};

/* A SymbolTable structure is a "manager" structure containing a pointer
   to an array of buckets, the number of key value pairs (bindings) in 
   the table, and the number of buckets. */

struct SymbolTable
{
   /* a pointer to an array containing pointers to each bucket in the
      hash table */
   struct SymbolTableBinding **buckets;
   /* the number of bindings (key-value pairs) in the hash table */
   size_t bindings;
   /* the number of buckets in the hash table (the size of the array) */
   size_t numBuckets;
};

SymTable_T SymTable_new(void)
{
   SymTable_T oSymTable;

   oSymTable = (SymTable_T) malloc(sizeof(struct SymbolTable));
   if (oSymTable == NULL)
      return NULL;

   oSymTable->buckets =
      (struct SymbolTableBinding**)
      calloc(THRESHOLD1, sizeof(struct SymbolTableBinding));
   if (oSymTable->buckets == NULL)
      return NULL;

   oSymTable->bindings = 0;
   oSymTable->numBuckets = THRESHOLD1;
   return oSymTable;
}

void SymTable_free(SymTable_T oSymTable)
{
   struct SymbolTableBinding *currentBinding;
   struct SymbolTableBinding *nextBinding;
   size_t length = oSymTable->numBuckets;
   size_t index;
   
   assert(oSymTable != NULL);

   /* access each bucket in buckets */
   for (index = 0; index < length; index++)
   {
      /* free each binding in the bucket */
      for (currentBinding = oSymTable->buckets[index];
           currentBinding != NULL;
           currentBinding = nextBinding)
      {
         nextBinding = currentBinding->next; /* keep access to next */
         /* free the key in the binding and then free the binding */
         free((char*) currentBinding->key);
         free(currentBinding);
      }
   }
   free(oSymTable->buckets);
   free(oSymTable);
}

size_t SymTable_getLength(SymTable_T oSymTable)
{
   assert(oSymTable != NULL);

   return oSymTable->bindings;
}

int SymTable_put(SymTable_T oSymTable, const char *pcKey,
                 const void *pvValue)
{
   struct SymbolTableBinding *firstBinding;
   struct SymbolTableBinding *currentBinding;
   struct SymbolTableBinding *newBinding;
   size_t firstBindingIndex;

   struct SymbolTableBinding **newBuckets;
   size_t newSize;
   size_t index;
   size_t newIndex;
   struct SymbolTableBinding *firstNode;
   struct SymbolTableBinding *currentNode;
   struct SymbolTableBinding *nextNode;

   assert(oSymTable != NULL && pcKey != NULL);

   /* expand the hash table */
   
   newSize = SymTable_newSize(oSymTable->bindings);
   /* if oSymTable->bindings and newSize are not equal to each other, it
      means a threshold for the binding count has been reached, so the
      table needs to be expanded */
   
   if (oSymTable->bindings != newSize)
   {
      /*  allocate memory for a new array with newSize buckets */
      newBuckets = (struct SymbolTableBinding**)
         calloc(newSize, sizeof(struct SymbolTableBinding));
      if (newBuckets == NULL)
         return 0; /* memory could not be allocated */

      /* iterate through each bucket in the original array */
      for (index = 0; index < oSymTable->numBuckets; index++)
      {
         firstNode = oSymTable->buckets[index];
         if (firstNode != NULL)
         {
            /* now for each node in the list, rehash its key  and
               insert the node into the new table */
            for (currentNode = firstNode; currentNode != NULL;
                  currentNode = nextNode)
            {
               nextNode = currentNode->next;
               newIndex = SymTable_hash(currentNode->key, newSize);
               currentNode->next = newBuckets[newIndex];
               newBuckets[newIndex] = currentNode;
            }
         }
      }
      free(oSymTable->buckets);
      oSymTable->buckets = newBuckets;
      oSymTable->numBuckets = newSize;
   }

   /* insert the binding */
   
   /* hash pcKey to find correct bucket to search */
   firstBindingIndex = SymTable_hash(pcKey, oSymTable->numBuckets);
   firstBinding =
      oSymTable->buckets[firstBindingIndex];

   /* traverse each binding in the bucket */
   for (currentBinding = firstBinding; currentBinding != NULL;
        currentBinding = currentBinding->next)
   {
      /* if binding with key pcKey already exists return 0 */
      if (strcmp(currentBinding->key, pcKey) == 0)
         return 0;
   }
   /* key not in table, so create and insert new binding to hold it */
   newBinding = (struct SymbolTableBinding*)
      malloc(sizeof(struct SymbolTableBinding));
   if (newBinding == NULL)
      return 0;
   newBinding->key = (const char*) malloc(strlen(pcKey) + 1);
   strcpy((char*) newBinding->key, pcKey); /* defensive copy of pcKey */
   newBinding->value = (void*) pvValue;
   /* add new node to front of list */
   newBinding->next = firstBinding;
   oSymTable->buckets[firstBindingIndex] =
      newBinding;
   oSymTable->bindings++;
   return 1;
}

void *SymTable_replace(SymTable_T oSymTable, const char *pcKey,
                       const void *pvValue)
{
   struct SymbolTableBinding *currentBinding;
   const void *oldValue;
   size_t firstBindingIndex;

   assert(oSymTable != NULL && pcKey != NULL);

   /* hash pcKey to find correct bucket to search */
   firstBindingIndex = SymTable_hash(pcKey, oSymTable->numBuckets);

   /* traverse each binding in the bucket */
   for (currentBinding = oSymTable->buckets[firstBindingIndex];
        currentBinding != NULL; currentBinding = currentBinding->next)
   {
      /* if binding with pcKey is encountered, then replace the node's
         value with pvValue and return the old value */
      if (strcmp(currentBinding->key, pcKey) == 0)
      {
         oldValue = currentBinding->value;
         currentBinding->value = (void*) pvValue;
         return (void*) oldValue;
      }
   }
   return NULL;
}

int SymTable_contains(SymTable_T oSymTable, const char *pcKey)
{
   struct SymbolTableBinding *currentBinding;
   size_t firstBindingIndex;

   assert(oSymTable != NULL && pcKey != NULL);

   /* hash pcKey to find correct bucket to search */
   firstBindingIndex = SymTable_hash(pcKey, oSymTable->numBuckets);

   /* traverse each binding in the bucket */
   for (currentBinding = oSymTable->buckets[firstBindingIndex];
        currentBinding != NULL; currentBinding = currentBinding->next)
   {
      if (strcmp(currentBinding->key, pcKey) == 0)
         return 1;
   }
   return 0;
}

void *SymTable_get(SymTable_T oSymTable, const char *pcKey)
{
   struct SymbolTableBinding *currentBinding;
   size_t firstBindingIndex;

   assert(oSymTable != NULL && pcKey != NULL);

   /* hash pcKey to find correct bucket to search */
   firstBindingIndex = SymTable_hash(pcKey, oSymTable->numBuckets);

   /* traverse each binding in the bucket */
   for (currentBinding = oSymTable->buckets[firstBindingIndex];
        currentBinding != NULL; currentBinding = currentBinding->next)
   {
      if (strcmp(currentBinding->key, pcKey) == 0)
         return currentBinding->value;
   }
   return NULL;
}

void *SymTable_remove(SymTable_T oSymTable, const char *pcKey)
{
   struct SymbolTableBinding *firstBinding;
   struct SymbolTableBinding *currentBinding;
   const void *oldValue;
   struct SymbolTableBinding *prevBinding = NULL;

   assert(oSymTable != NULL && pcKey != NULL);

   /* hash pcKey to find correct bucket to search */
   firstBinding =
      oSymTable->buckets[SymTable_hash(pcKey, oSymTable->numBuckets)];

   /* traverse each binding in the bucket */
   for (currentBinding = firstBinding; currentBinding != NULL;
        currentBinding = currentBinding->next)
   {
      if (strcmp(currentBinding->key, pcKey) == 0)
      {
         /* if removing from front of bucket, just point first to next 
          */
         if (prevBinding == NULL)
         {
            oSymTable->
               buckets[SymTable_hash(pcKey, oSymTable->numBuckets)]
               = currentBinding->next;
            oldValue = currentBinding->value;
            free((char*) currentBinding->key);
            free(currentBinding);
            oSymTable->bindings--;
            return (void*) oldValue;
         }
         else
         {
            prevBinding->next = currentBinding->next;
            oldValue = currentBinding->value;
            free((char*) currentBinding->key);
            free(currentBinding);
            oSymTable->bindings--;
            return (void*) oldValue;
         }
      }
      prevBinding = currentBinding;
   }
   return NULL;
}

void SymTable_map(SymTable_T oSymTable,
                  void (*pfApply)(const char *pcKey, void *pvValue,
                                  void *pvExtra), const void *pvExtra)
{
   struct SymbolTableBinding *currentBinding;
   size_t length = oSymTable->numBuckets;
   size_t index;

   assert(oSymTable != NULL);

   /* iterate over each bucket in buckets */
   for (index = 0; index < length; index++)
   {
      
      /* traverse each binding in the bucket */
      for (currentBinding = oSymTable->buckets[index];
           currentBinding != NULL;
           currentBinding = currentBinding->next)
      {
         /* apply *pfApply to each binding */
         (*pfApply) (currentBinding->key, currentBinding->value,
                     (void*) pvExtra);
      }
   }
}

/* Return a hash code for pcKey that is between 0 and uBucketCount-1,
   inclusive. */

static size_t SymTable_hash(const char *pcKey, size_t uBucketCount)
{
   const size_t HASH_MULTIPLIER = 65599;
   size_t u;
   size_t uHash = 0;

   assert(pcKey != NULL);

   for (u = 0; pcKey[u] != '\0'; u++)
      uHash = uHash * HASH_MULTIPLIER + (size_t)pcKey[u];

   return uHash % uBucketCount;
}

/* return a size_t representing the new expanded size of the hash table
   array based on the current number of bindings uBindingsCount */

static size_t SymTable_newSize(size_t uBindingsCount) {
   size_t threshold = uBindingsCount + 1;
   switch(threshold)
   {
      case THRESHOLD1 + 1:
         return THRESHOLD2;
      case THRESHOLD2 + 1:
         return THRESHOLD3;
      case THRESHOLD3 + 1:
         return THRESHOLD4;
      case THRESHOLD4 + 1:
         return THRESHOLD5;
      case THRESHOLD5 + 1:
         return THRESHOLD6;
      case THRESHOLD6 + 1:
         return THRESHOLD7;
      case THRESHOLD7 + 1:
         return THRESHOLD8;
      default:
         return uBindingsCount;
   }
}
