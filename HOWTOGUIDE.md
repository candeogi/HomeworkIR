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
Abbiamo utilizzato TREC Topics.
Questi contengono quattro campi indicati dai tag: _num, title, description, narrative._
Il campo _num_ contiene un numero identificativo per il topic.
Il campo _title_ contiene una piccola query, tipica di una web application, mentre _description_ una versione più precisa e più lunga.
Il campo _narrative_ descrive invece il criterio usato per l'assegnazione della rilevanza e dunque non viene considerato come query.
```
TrecQueryTags.idtag=num
TrecQueryTags.process=title,desc
TrecQueryTags.skip=narr
```
# Run
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

Poi posso eseguire l'evaluation anche con terrier con:
`bin/trec_terrier.sh -e ./var/results/TF_IDF_0.res` 
dove il path cambia in base al file results. 

I risultati dell'evaluation saranno contenuti in `var/results/TF_IDF_0.eval`.
