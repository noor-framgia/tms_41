# PublicActivity.enabled = false
Subject.create(name: 'Algorithm', description: 'Heart of computer science, We read book of Core Man.', tasks_attributes: [{name: 'Computation complexity', description: 'Analysis of performance of an algorithm'}, {name: 'Greeedy algorithm', description: 'Algorithm finding the best things first'}, {name: 'Divide and conquare', description: 'Solving problem breaking it into smaller part'}, {name: 'Searching algorithm', description: 'Binary search'}, {name: 'Sorting algorithm', description: 'Bubble, quick, merge, insertion, selection, heap sort'}])

Subject.create(name: 'OOPL', description: 'Object oriented programming langualge: C++, Java, C#', tasks_attributes: [{name: 'Control structure', description: 'Loop, conditions'}, {name: 'Memory management', description: 'pointer, struct, linked list'}, {name: 'Collection', description: 'List, map, set'}, {name: 'Project', description: 'Project based on networking'}])

Subject.create(name: 'Network Security', description: 'Responsible for secure communication and storage', tasks_attributes: [{name: 'DES', description: 'Data Encryption Standard'}, {name: 'AES', description: 'Advanced Encryption Standard not based on fiestal network'}, {name: 'Hash', description: 'Sha1, Sha2, MD5'}, {name: 'Public key encryption', description: 'Public key and private key based secure comminication'}, {name: 'Digital signature', description: 'Dont protect data but verify the authenticity'}, {name: 'Symetric key base encryption', description: 'Both sender and receiver share the same key: DES, AES'}])


cse = Course.create(name: "CSE", description: "Money making job will be available", start_date: DateTime.strptime("09/14/2015 8:00", "%m/%d/%Y %H:%M"), end_date: DateTime.strptime("09/20/2015 8:00", "%m/%d/%Y %H:%M"))
Course.create(name: "EEE", description: "Now it is back to its original position", start_date: DateTime.strptime("09/14/2015 8:00", "%m/%d/%Y %H:%M"), end_date: DateTime.strptime("09/20/2015 8:00", "%m/%d/%Y %H:%M"))
Course.create(name: "Physics", description: "Working to find out rules of nature", start_date: DateTime.strptime("09/14/2015 8:00", "%m/%d/%Y %H:%M"), end_date: DateTime.strptime("09/20/2015 8:00", "%m/%d/%Y %H:%M"))


Subject.all.each do |s|
  cse.course_subjects.create(subject: s)
end


manazirahsan = User.create(name: 'Manazir Ahsan', role:0, email: 'manazir.bd@gmail.com', password:"password", password_confirmation:"password")
manna = User.create(name: 'Manna', role:1, email: 'manazirahsan.developer@gmail.com', password:"password", password_confirmation:"password")
bador = User.create(name: 'Manazir Ahsanss ( Manna )', role:1, email: 'manazir.ahsan@framgia.com', password:"password", password_confirmation:"password")
mahmud = User.create(name: 'Md Mahmudur Rahman', role:0, email: 'md.mahmud.rahman@gmail.com', password:"password", password_confirmation:"password")
noor = User.create(name: 'Noor Ahmed Biswas', role:0, email: 'noor.ahmed.biswas@gmail.com', password:"password", password_confirmation:"password")


cse.users = [manazirahsan, manna, bador, mahmud, noor]

# Custom course tasks population
CourseSubject.first.tasks = CourseSubject.first.subject.tasks

# UserTask population
User.first.tasks=User.first.course_subjects.first.tasks
UserTask.create! user_id:3, task_id:7
UserTask.create! user_id:3, task_id:8
UserTask.create! user_id:3, task_id:9
UserTask.create! user_id:3, task_id:10