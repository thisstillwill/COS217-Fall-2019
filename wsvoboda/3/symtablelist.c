/*--------------------------------------------------------------------*/
/* symtablelist.c                                                     */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#include "symtable.h"
#include <stdlib.h>
#include <assert.h>
#include <string.h>

/* Each binding is stored in a SymbolTableNode. SymbolTableNodes are
   linked to form a list. */

struct SymbolTableNode
{
   /* string that uniquely identifies its binding */
   const char *key;
   /* data that is pertinent to its key */
   void *value;
   /* pointer to the next node in the list */
   struct SymbolTableNode *next;
};

/* A SymbolTable structure is a "manager" structure that points to the
   first SymbolTableNode. */

struct SymbolTable
{
   /* pointer to the first node in the list */
   struct SymbolTableNode *first;
   /* number of bindings in the symbol table */
   size_t length;
};

SymTable_T SymTable_new(void) {
   SymTable_T oSymTable;

   oSymTable = (SymTable_T) malloc(sizeof(struct SymbolTable));
   if (oSymTable == NULL)
      return NULL;

   oSymTable->first = NULL;
   oSymTable->length = 0;
   return oSymTable;
}

void SymTable_free(SymTable_T oSymTable)
{
   struct SymbolTableNode *currentNode;
   struct SymbolTableNode *nextNode;

   assert(oSymTable != NULL);

   /* traverse each node in list, freeing them one by one */
   for (currentNode = oSymTable->first; currentNode != NULL;
        currentNode = nextNode)
   {
      nextNode = currentNode->next; /* retain access to next node */
      free((char*) currentNode->key);
      free(currentNode);
   }
   free(oSymTable);
}

size_t SymTable_getLength(SymTable_T oSymTable)
{
   assert(oSymTable != NULL);
   
   return oSymTable->length; 
}

int SymTable_put(SymTable_T oSymTable, const char *pcKey,
                 const void *pvValue)
{
   struct SymbolTableNode *currentNode;
   struct SymbolTableNode *newNode;

   assert(oSymTable != NULL && pcKey != NULL);

   /* traverse each node in the list */
   for (currentNode = oSymTable->first; currentNode != NULL;
        currentNode = currentNode->next)
   {
      /* if binding with key pcKey already exists return 0 */
      if (strcmp(currentNode->key, pcKey) == 0)
         return 0;
   }
   /* key not in table, so create and insert new node to hold it */
   newNode = (struct SymbolTableNode*)
      malloc(sizeof(struct SymbolTableNode));
   if (newNode == NULL)
      return 0;
   newNode->key = (const char*) malloc(strlen(pcKey) + 1);
   strcpy((char*) newNode->key, pcKey); /* defensive copy of pcKey */
   newNode->value = (void*) pvValue;
   /* add new node to front of list */
   newNode->next = oSymTable->first;
   oSymTable->first = newNode;
   oSymTable->length++;
   return 1;
}

void *SymTable_replace(SymTable_T oSymTable, const char *pcKey,
                       const void *pvValue)
{
   struct SymbolTableNode *currentNode;
   const void *oldValue;

   assert(oSymTable != NULL && pcKey != NULL);

   /* traverse each node in the list */
   for (currentNode = oSymTable->first; currentNode != NULL;
        currentNode = currentNode->next)
   {
      /* if node with pcKey is encountered, then replace the node's
         value with pvValue and return the old value */
      if (strcmp(currentNode->key, pcKey) == 0)
      {
         oldValue = currentNode->value;
         currentNode->value = (void*) pvValue;
         return (void*) oldValue;
      }
   }
   return NULL;
}

int SymTable_contains(SymTable_T oSymTable, const char *pcKey)
{
   struct SymbolTableNode *currentNode;

   assert(oSymTable != NULL && pcKey != NULL);
   
   /* traverse each node in the list */
   for (currentNode = oSymTable->first; currentNode != NULL;
        currentNode = currentNode->next)
   {
      if (strcmp(currentNode->key, pcKey) == 0)
         return 1;
   }
   return 0;
}

void *SymTable_get(SymTable_T oSymTable, const char *pcKey)
{
   struct SymbolTableNode *currentNode;

   assert(oSymTable != NULL && pcKey != NULL);

   /* traverse each node in the list */
   for (currentNode = oSymTable->first; currentNode != NULL;
        currentNode = currentNode->next)
   {
      if (strcmp(currentNode->key, pcKey) == 0)
         return currentNode->value;
   }
   return NULL;
}

void *SymTable_remove(SymTable_T oSymTable, const char *pcKey)
{
   struct SymbolTableNode *currentNode;
   const void *oldValue;
   struct SymbolTableNode *prevNode = NULL;

   assert(oSymTable != NULL && pcKey != NULL);

   /* traverse each node in the list */
   for (currentNode = oSymTable->first; currentNode != NULL;
        currentNode = currentNode->next)
   {
      if (strcmp(currentNode->key, pcKey) == 0)
      {
         /* if removing from front of list, just point first to next */
         if (prevNode == NULL)
         {
            oSymTable->first = currentNode->next;
            oldValue = currentNode->value;
            free((char*) currentNode->key);
            free(currentNode);
            oSymTable->length--;
            return (void*) oldValue;
         }
         else
         {
            prevNode->next = currentNode->next;
            oldValue = currentNode->value;
            free((char*) currentNode->key);
            free(currentNode);
            oSymTable->length--;
            return (void*) oldValue;
         }
      }
      prevNode = currentNode;
   }
   return NULL;
}

void SymTable_map(SymTable_T oSymTable,
                  void (*pfApply)(const char *pcKey, void *pvValue,
                                  void *pvExtra), const void *pvExtra)
{
   struct SymbolTableNode *currentNode;

   assert(oSymTable != NULL);

   /* traverse each node in the list */
   for (currentNode = oSymTable->first; currentNode != NULL;
        currentNode = currentNode->next)
   {
      /* apply *pfApply to each binding */
      (*pfApply) (currentNode->key, currentNode->value,
                  (void*) pvExtra);
   }
}
