gawk -F, 'BEGIN { OFS="," }
{
  if ($3 == 2 && $13 ~ /S/) {
    # Change only in the Sex column
    if ($6 == "female") $6 = "F";
    else if ($6 == "male") $6 = "M";
    print $0;  # Print the modified row
  }
}' titanic.csv | tee /dev/tty | gawk -F, '{
  # Check if age is a valid number before adding to sum
  if ($7 ~ /^[0-9]+(\.[0-9]+)?$/) {
    sum += $7;
    count++;
  }
} END {
  if (count > 0)
    print "Average Age of the above data: " sum/count;
  else
    print "No Data Found";
}'
