local taskList = {}

local function loadTasks()
local file = io.open("todoList/todo.txt", "r")
if file then
for task in file:lines() do
table.insert(taskList, task)
end
file:close()
end
end

local function addTask(task)
table.insert(taskList, task)
print("Task added: " .. task)
end

local function viewTasks()
print("Tasks:")
for i, task in ipairs(taskList) do
print(i .. ") " .. task)
end
end

local function removeTask(taskIndex)
local removedTask = table.remove(taskList, taskIndex)
print("Task removed: " .. removedTask)
end

local function saveTasks()
local file = io.open("todoList/todo.txt", "w")
for i, task in ipairs(taskList) do
file:write(task .. "\n")
end
file:close()
print("Tasks saved to file.")
end

loadTasks()

while true do
io.write("Enter a command (add, view, remove, save, quit): ")
local cmd = io.read()
if cmd == "add" then
io.write("Enter a task: ")
local task = io.read()
addTask(task)
elseif cmd == "view" then
viewTasks()
elseif cmd == "remove" then
io.write("Enter the task number to remove: ")
local taskIndex = tonumber(io.read())
removeTask(taskIndex)
elseif cmd == "save" then
saveTasks()
elseif cmd == "quit" then
break
else
print("Invalid command. Try again.")
end
end
