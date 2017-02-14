#!/bin/bash

# Change directory to where data lives.
# Change this directory as needed
dataDir="$HOME/fMRI/ABCD/AWS_Data/aux_incoming_Nov_3rd_2016_2/"

#find $dataDir -path "*exported*.txt" -exec -c 'iconv -f UTF-16 -t ASCII {} > {}' \;

#find . -type f -path "*exported*.txt" -exec -c 'iconv -f UTF-16 -t ASCII "{}" > "{}"' \;
n=0
i=0
j=0
cd $dataDir
for site in *; do
  for sub in $site/*; do
#    echo $sub
    part=${sub#*'/'}
    part=${part#'NDAR_INV'}
    #echo $part
    for time in $sub/*; do
      for task in $time/*exported*; do
        taskCheck=${task#*'/'}; taskCheck=${taskCheck#*'/'}; taskCheck=${taskCheck#*'/'}; taskCheck=${taskCheck%'-'*}
        if [ $taskCheck == 'mid' ];
          then
            tag='_MID'
            #echo $tag
        elif [ ${taskCheck%'-'*} == 'nback' ];
          then
            if [ ${taskCheck#*'-'} == 'rec' ];
              then
                tag='_REC'
                #echo $tag
            else
              tag='_WM'
              #echo $tag
            fi
        elif [ $taskCheck == 'sst' ];
          then
            tag='_SST'
            #echo $tag
        fi
        #echo $taskCheck
        #echo $tag

        #echo $part$tag
        for data in $task/*txt; do
          #if [ -e $dataDir$data ];
          #  then
          dataPath=$dataDir${data%'/'*}'/'
          #    cp $dataDir$data $dataDir${data%'.'*}'_original.txt'
          #    rm $dataDir$data

          cp $dataDir$data $dataPath$part'_original.txt'
          rm $dataDir$data

          echo $dataPath'NDAR_INV'$part'_original.txt'


          #    convFile=$dataDir${data%'.'*} #'.txt'

          iconv -f UTF-16 -t ASCII $dataPath$part'_original.txt' > $dataPath'NDAR_INV'$part$tag'.txt'
          #d=${d%'.'*}
          #echo ${data%'.'*}
          #echo $dataDir${data}
          #echo $dataPath

          #echo $part'_original.txt'

          #echo ${data%'/'*}
          #echo $data
          ##echo $dataDir$data

          #echo ${part#'NDAR_INV'}
          #else
          #  iconv -f UTF-16 -t ASCII $dataDir$data > $dataDir${data%'/'*}'/'$part$tag'.txt'
          #fi
          #echo '1'

        #echo $convFile
        #echo $dataDir$data
        #echo 'and'
        #echo $dataDir${data%'.'*}'_original.txt'
        #  echo ${data%'/'*}'/'$part$tag'.txt'
        done
        #iconv -f UTF-16 -t ASCII "$part$tag.txt" > "$part$tag.txt"

        #echo $task
        #let n+=1
      done
    done
    #echo $sub
    let i+=1
  done
  #echo $site/
  let j+=1
done
#echo $i
#echo $j
#echo $n
#iconv -f UTF-16 -t ASCII J2CBCRYX_WM.txt > J2CBCRYX_WM_conv.txt
