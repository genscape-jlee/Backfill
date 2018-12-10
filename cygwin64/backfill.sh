#!/bin/zsh
if [[ "$#" -ne 4 ]] {
  echo "usage: './backfill.sh <tag> \"<regionId>(,<regionId>)\" <start: YYYY-MM-DD( HH24:MI)> <end: YYYY-MM-DD( HH24:MI)>";
  exit 1;
}

if [[ -z $1 ]] {
  echo "the tag parameter MUST contain a value";
  exit 2;
}
tag=$1;

if [[ -z $2 ]] {
  echo "the region id list must contain at least one value, '$2' is empty, exiting";
  exit 3;
}
region_id_list=("${(s/,/)${2}}")

start_date=${3//(-|:| )/};
end_date=${4//(-|:| )/};

now=`date +"%m/%d/%Y" -d "${start_date}"`;
end=`date +"%m/%d/%Y" -d "${end_date} + 1 day"`;

REPORT_RUNNER_URL_BASE="http://genapps.genscape.com/PowerReports/reportrunner?_group=dom-reports&y=1&_report=trans-lines&sql=historic&_renderer=transxml";
REPORT_DIR="./output/${tag}";

echo "start `date`";
if [[ ! -d ${REPORT_DIR} ]]
then
  mkdir "${REPORT_DIR}";
  echo "created ${REPORT_DIR}";
fi

while [ ${now} != ${end} ];
do
  echo "retrieving report(s) for: ${now}";
  DATE_STR=`echo "${now}" | sed 's/\//%2F/g'`;
  FILE_DATE_STR=`date +"%Y-%m-%d" -d ${now}`;

  for i in $region_id_list;
  do
    FILE_NAME=TransmissionLineDatafeed_Region${i}_${FILE_DATE_STR}.xml;
    RR_URL="${REPORT_RUNNER_URL_BASE}&regionId=${i}&reportDate=${DATE_STR}";

    echo "Generating ${FILE_NAME} from ${RR_URL}";
    wget --output-document=${REPORT_DIR}/${FILE_NAME}.tmp ${RR_URL};

    xmllint --format ${REPORT_DIR}/${FILE_NAME}.tmp > ${REPORT_DIR}/${FILE_NAME};
    rm ${REPORT_DIR}/${FILE_NAME}.tmp;
  done;

  now_year_month=`date +"%Y-%m" -d "${now}"`;
  next=`date +"%m/%d/%Y" -d "${now} + 1 day"`;
  next_year_month=`date +"%Y-%m" -d "${next}"`;
  if [[ ${now_year_month} != ${next_year_month} ]]
  then
    echo "creating archive for ${now_year_month}";
    /cygdrive/c/Program\ Files/7-Zip/7z.exe a ${REPORT_DIR}/${tag}.${now_year_month}.zip ${REPORT_DIR}/TransmissionLineDatafeed_Region*_${now_year_month}-*.xml;
  fi
  now=${next};
done;
echo "creating archive for ${now_year_month}";
/cygdrive/c/Program\ Files/7-Zip/7z.exe a ${REPORT_DIR}/${tag}.${now_year_month}.zip ${REPORT_DIR}/TransmissionLineDatafeed_Region*_${now_year_month}-*.xml;

echo "end `date`";
