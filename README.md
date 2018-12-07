# HomeworkIR
Repository for Information Retrieval Course 

## How to

First off, set collection.spec on terrier

`sh bin/trec_setup.sh /path-to-collection`

After that you can set the terrier.properties file and proceed with indexing:

`sh bin/trec_terrier.sh -i`

Index will be created on var/index folder of terrier. 
You can also use the command `--printstats` to see stats related to the index.

After setting your query model on the properties file, you can make a query via batch by using the command:

`sh bin/interactive_terrier.sh`

# TREC Topics
Abbiamo utilizzato TREC Topics come _evaluation corpus_.
Questi contengono quattro campi indicati dai tag: _num, title, description, narrative._
Il campo _num_ contiene un numero identificativo per il topic.
Il campo _title_ contiene una piccola query, tipica di una web application, mentre _description_ una versione più precisa e più lunga.
Il campo _narrative_ descrive invece il criterio usato per l'assegnazione della rilevanza e dunque non viene considerato come query.
```
TrecQueryTags.idtag=num
TrecQueryTags.process=title,desc
TrecQueryTags.skip=narr
```
# Runs
Ho eseguito quattro run sulla collezione:

1. Stoplist, Porter Stemmer, BM25
2. Stoplist, Porter Stemmer, TF_IDF
3. No Stoplist, Porter Stemmer, BM25
4. No Stoplist, No Porter Stemmer, TF_IDF