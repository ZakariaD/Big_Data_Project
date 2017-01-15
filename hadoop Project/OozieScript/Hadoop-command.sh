
#Please import the workflows/coordinator json files from the STEP 3 folder and use the following commands to copy the Hive and shell scripts in a specified directory within HDFS
#I put the script files in the STEP 3 folder just for indication !!

# In the cloudera terminal

hadoop fs -mkdir /user/hdfs/BigDataProject
hadoop fs -copyFromLocal "/home/cloudera/Desktop/BigDataProject/OozieScript/hive_shell_oozie_script"  /user/hdfs/BigDataProject

#this will be in use for the extrawork

hadoop fs -copyFromLocal "/home/cloudera/Desktop/BigDataProject/ExtraWork"  /user/hdfs/BigDataProject
