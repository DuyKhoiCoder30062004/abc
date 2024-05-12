#!/bin/bash

<<Block_comment
Thực hiện tạo ra 1 Script hiển thị Menu sau:
Hãy lựa chọn:
1. Hiển thị thư mục hiện hành.
2. Nhập vào đường dẫn, hãy chuyển đến thư mục mới theo đường dẫn.
3. Tạo thư mục mới.
4. Đổi tên thư mục.
5. Xóa thư mục.
6. Liệt kê thư mục và tập tin trong thư mục hiện hành.
7. Tạo file mới.
8. Đổi tên file.
9. Xóa file.
10.Xem nội dung file.
11.Cập nhật nội dung của file.
12.Di chuyển file.
13.Copy file
14.Thoát.
Lưu ý: Lựa chọn sẽ lặp lại liên tục cho đến khi bấm phím số 14.
Các yêu cầu khi thực hiện đều phải có thông báo thành công hay báo lỗi.


echo -n "Enter the name of a country: "
read COUNTRY

echo -n "The official language of $COUNTRY is "

case $COUNTRY in

  Lithuania)
    echo -n "Lithuanian"
    ;;

  Romania | Moldova)
    echo -n "Romanian"
    ;;

  Italy | "San Marino" | Switzerland | "Vatican City")
    echo -n "Italian"
    ;;

  *)
    echo -n "unknown"
    ;;
esac
Block_comment

while true; do
 echo "Welcome you to my set of menu of Auto-scripting "
 echo "Please enter any selection that you wish to perform: "
 echo "1. Print my Working Directory"
 echo "2. Enter a working directory.Direct to other directory" 
 echo "3. Create a new directory"
 echo "4. Rename a directory"
 echo "5. Remove a directory"
 echo "6. List out files and directories in my current directory"
 echo "7. Create a new file"
 echo "8. Rename a file"
 echo "9. Remove a file"
 echo "10.See the contents inside of a file"
 echo "11.Update file’s contents"
 echo "12. File moving"
 echo "13. Copy file"
 echo "14. Exit"   
 read -p "Enter your choice (1-14): " choice
 case $choice in 
   1)
     echo "Your current working directory is: $(pwd)"    
    ;;
   2)
     read -p "Please enter your wanted directory path: " working_path
     cd $working_path
     if [["$working_path" == $(pwd) ]]; then
         echo "Unable to add in any duplicate working_path with the same name"
     else
         echo "The program has just modified your change successfully!"
         echo "Your current working directory is: $(pwd)"
     fi
     ;;
   3)
       read -p  "Enter any directories you wish to create" directory
       if [ -d "/$directory" ]; then
        echo "Directory '$directory' already exists somewhere on the system."
       else
        mkdir "/$directory"
       if [ $? -eq 0 ]; then
         echo "Directory '$directory' created successfully."
       else
         echo "Failed to create directory "$directory"."
       fi
      fi
    ;;
   4)
     read -p  "Enter any directories you wish to rename?: " directory
     read -p  "Rename the chosen directory to: " renamed
     mv $directory  $renamed
     if [[ $? -eq 0 ]]; then
       echo "Directory name changed successfully"
     else
       echo "Failed, try again!" 
     fi 
    ;; 
   5)
     read -p "Enter any directores you wish to delete?: " directory
     rmdir $directory 
     if [[ $? -eq 0 ]]; then
      echo "Directory successfully deleted" 
     else 
      echo "Failed, try again!"
     fi
    ;;
   6)
     echo "Welcome to directories and files lists!"
     ls -l
     if [[ $? -eq 0 ]]; then
      echo "We successfully listed out directories and files as you asked for!"
     else 
      echo "Oops, something went wrong!"
     fi
     ;;
   7)
     read -p "Enter any filename you wish to create" file
     touch $file 
     if [[ $? -eq 0 ]]; then
      echo "File created successfully!" 
     else
      echo "File failed to be created!"
     fi 
    ;;
   8)
     read -p "Enter any filename you wish to rename" file
     read -p "Enter the replaced name for your file" rename
     mv "$file" "$rename"
     
     if [[ "$?" -eq 0 ]]; then
       echo "File's named replaced successfully" 
     else
       echo "Failed to renamed" 
     fi
    ;;
   9)
     read -p "Enter any file name you wish to delete" file 
     rm "$file"
     if	[[ "$?"	-eq 0 ]]; then
       echo "File deleted successfully"
     else
       echo "Failed to delete"	
     fi
    ;;
  10)
      read -p "Enter any file you wish to see its content" file
      cat $file 
      if [[ "$?" -eq 0 ]]; then
       echo "File read successfully"
     else
       echo "Failed to read"
     fi
    ;;
  11)
     read -p "Enter any content you wish to make modification for your file" content
     read -p "Enter anything inside the file you wish for which content to be modified" file
     echo $content >> $file
     if [[ "$?" -eq 0 ]]; then
       echo "File appended successfully"
       echo "Here is your file content" 
       echo $file
     else
       echo "Failed to append contents to your file"
     fi
    ;;
  12)
     read -p "Enter any file you wish to switch place" file
     read -p "Enter any file or directory you wish to move to" new_place
     mv $file $new_place
     if [[ "$?" -eq 0 ]]; then
       echo "File moved successfully"
     else
       echo "Failed to move file"
     fi 
    ;;
  13)
     read -p "Enter any file you wish to copy" file
     read -p "Enter a directory you wish to copy your file to: " directory
     cp "$file" "$directory"
     if [[ "$?" -eq 0 ]]; then
       echo "File copied successfully"
     else
       echo "Failed to copy"
     fi
    ;;
  14)
    echo "You just selected exit. See you again!"
    exit 0
    ;;
  *) 
    echo "Invalid choice! Please select again from (1-14)!"
    ;;
esac
done
echo "The program ends here, may I see you soon!"
