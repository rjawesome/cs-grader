# set test cases here
inputs=("false\n93\n20\n90" "true\n93.0\n30\n90.0\n100\n50\n90")
outputs=("78" "30")

# get their outputs
users=()
for i in "${!inputs[@]}"; do
  users[$i]=$(echo -e ${inputs[$i]} | java GradeCalculator.java)
done

# grade their outputs
score=0
for i in "${!inputs[@]}"; do
  # allow output to be +/- 1
  for j in {-1..1}; do
    if echo ${users[$i]} | grep $((${outputs[$i]}+$j)) >/dev/null; then
      score=$(($score+1))
      break
    fi
  done
done

# output score
echo The score is $score / ${#inputs[@]}
