pres_path=`pwd`

#Please set your stanford parser (ver 4.0.) path in the bashrc
echo 'Your stanford parser path set is :'$stanford_parser_four_path

#stanford_parser_four_path=`echo $HOME_anu_test/Parsers/stanford-parser/stanford-parser-4.0.0`

java -mx200m -cp $stanford_parser_four_path/*:  edu.stanford.nlp.parser.lexparser.LexicalizedParser -retainTMPSubcategories -outputFormat "oneline"  $stanford_parser_four_path/edu/stanford/nlp/models/lexparser/englishPCFG.ser.gz $* 1> $1-parsed.out 2>$1-parse.log

cat $1
cat $1-parsed.out
echo '--------'

java -mx200m -cp $stanford_parser_four_path/*:  edu.stanford.nlp.parser.lexparser.LexicalizedParser -retainTMPSubcategories -outputFormat "xmlTree"  $stanford_parser_four_path/edu/stanford/nlp/models/lexparser/englishPCFG.ser.gz $* 1> $1-parsed.xml 2>$1-parse.log


#java -mx200m -cp $parser_path/*:  edu.stanford.nlp.parser.lexparser.LexicalizedParser -retainTMPSubcategories -outputFormat "xmlTree"   $parser_path/edu/stanford/nlp/models/lexparser/englishPCFG.ser.gz $* 1> $1-parsed.xml 2>$1-parse.log

cd $pres_path
#python prog/constituency-to-conll.py $1-parsed.out > $1.conll
#python prog/largest-np-pp-with-sbar.py  $1.conll

python prog/find-np-pp-xml.py $1-parsed.xml
