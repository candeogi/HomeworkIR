# How to

First off, set collection.spec on terrier

`sh bin/trec_setup.sh /path-to-collection`

After that you can set the terrier.properties file and proceed with indexing:

`sh bin/trec_terrier.sh -i`

Index will be created on var/index folder of terrier. 
You can also use the command `--printstats` to see stats related to the index.

`sh bin/trec_terrier.sh --printstats`

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

# Evaluation Corpus 
_Test Collection_ or _evaluation corpus_: documents, queries and relevance judgements.
	
Relevance judgements. -> QRels file
Nel nostro caso la _relevance judgement_ è binaria, questo significa che il documento o è rilevante o non lo è.

Pooling.

Prende i top k result (k tra 50 e 200) del ranking ottenuto da diversi search engines o retrieval algorithms.
Vengono mergiati in una pool (rimuovendo i duplicati) e i documenti sono presentati in ordine random.
Nel caso dell'homework i trec topic sono 50 (351-400).

# Evaluation con trec_terrier
Se specificati su `terrier.properties` i campi:
```
#location of topics
trec.topics=/home/giovannicandeo/IR/default_data/topics.351-400_trec7.txt
#location of qrels
trec.qrels=/home/giovannicandeo/IR/default_data/qrels.trec7.txt
```
Posso eseguire il comando
`sh bin/trec_terrier.sh -r`

Crea i risultati in `var/results`. 
Poi posso eseguire l'evaluation con:
`bin/trec_terrier.sh -e ./var/results/TF_IDF_0.res` 
dove il path cambia in base al file results. 

I risultati dell'evaluation saranno contenuti in `var/results/TF_IDF_0.eval`.

# Evaluation con trec_eval 9.0
```
./trec_eval -q -m set pool.txt run.txt
```
Per set-based evaluation uso `set`. Altrimenti `all_trec`

Nel nostro caso prendiamo come pool le qrels nel path:
`/home/giovannicandeo/IR/default_data/qrels.trec7.txt`
E la run fatta in terrier contenuta nel file:
`/home/giovannicandeo/terrier-core-4.4/var/results/TF_IDF_0.res`

Nel contesto possiamo usare ad esempio questo comando da terminale per salvarci i risultati su un file txt.

```
./trec_eval -q -m all_trec /home/giovannicandeo/IR/default_data/qrels.trec7.txt /home/giovannicandeo/terrier-core-4.4/var/results/TF_IDF_0.res > /home/giovannicandeo/IR/HomeworkIR/trecEvalResults/evauationRun0.txt
```

# ANOVA 

https://books.google.it/books?id=fxRwDwAAQBAJ&pg=PA44&lpg=PA44&dq=one+way+ANOVA+information+retrieval&source=bl&ots=-EFdNdi-BW&sig=7BhAzY3OrGV3x6sTmKwRDDQ6YWY&hl=it&sa=X&ved=2ahUKEwjYup7W457fAhWOuIsKHWZXD2gQ6AEwBXoECAcQAQ#v=onepage&q=one%20way%20ANOVA%20information%20retrieval&f=false

trecEvalResultFile = fopen('evauationRun0.txt');

c = textscan(trecEvalResultFile,'%s %s %f /n');

fclose(trecEvalResultFile);