# Import necessary modules
import os

# Function to display the to-do list
def show_todo_list(todo_list):
    print("Your To-Do List:")
    for index, task in enumerate(todo_list, start=1):
        print(f"{index}. {task}")

# Function to add a task to the to-do list
def add_task(todo_list, task):
    todo_list.append(task)
    print(f"Task '{task}' added to the list.")

# Function to save the to-do list as a text file
def save_as_text(todo_list):
    with open("todo_list.txt", "w") as file:
        for task in todo_list:
            file.write(f"{task}\n")
    print("To-Do list saved as 'todo_list.txt'.")

# Main program loop
todo_list = []

while True:
    print("\nOptions:")
    print("1. Show To-Do List")
    print("2. Add Task")
    print("3. Save As Text")
    print("4. Exit")

    choice = input("Enter your choice (1/2/3/4): ")

    if choice == "1":
        show_todo_list(todo_list)
    elif choice == "2":
        new_task = input("Enter the task: ")
        add_task(todo_list, new_task)
    elif choice == "3":
        save_as_text(todo_list)
    elif choice == "4":
        print("Exiting the to-do app. Have a productive day!")
        break
    else:
        print("Invalid choice. Please enter 1, 2, 3, or 4.")

# End of the program
