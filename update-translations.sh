#!/bin/sh

find . -name '*.java' -o -name '*.java.in' > translation.filelist
xgettext -kGT.tr -f translation.filelist -o org/postgresql/translation/messages.pot
rm translation.filelist

for i in org/postgresql/translation/*.po
do
	msgmerge -U $i org/postgresql/translation/messages.pot
	polang=`basename $i .po`
	msgfmt -j -l $polang -r org.postgresql.translation.messages -d . $i
done