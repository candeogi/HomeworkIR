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


# Runs
Ho eseguito quattro run sulla collezione:

1. Stoplist, Porter Stemmer, BM25
2. Stoplist, Porter Stemmer, TF_IDF
3. No Stoplist, Porter Stemmer, BM25
4. No Stoplist, No Porter Stemmer, TF_IDF