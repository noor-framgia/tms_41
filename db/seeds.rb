Subject.create(name: 'Algorithm', description: 'Heart of computer science, We read book of Core Man.', tasks_attributes: [{name: 'Computation complexity', description: 'Analysis of performance of an algorithm'}, {name: 'Greeedy algorithm', description: 'Algorithm finding the best things first'}, {name: 'Divide and conquare', description: 'Solving problem breaking it into smaller part'}, {name: 'Searching algorithm', description: 'Binary search'}, {name: 'Sorting algorithm', description: 'Bubble, quick, merge, insertion, selection, heap sort'}])

Subject.create(name: 'OOPL', description: 'Object oriented programming langualge: C++, Java, C#', tasks_attributes: [{name: 'Control structure', description: 'Loop, conditions'}, {name: 'Memory management', description: 'pointer, struct, linked list'}, {name: 'Collection', description: 'List, map, set'}, {name: 'Project', description: 'Project based on networking'}])

Subject.create(name: 'Network Security', description: 'Responsible for secure communication and storage', tasks_attributes: [{name: 'DES', description: 'Data Encryption Standard'}, {name: 'AES', description: 'Advanced Encryption Standard not based on fiestal network'}, {name: 'Hash', description: 'Sha1, Sha2, MD5'}, {name: 'Public key encryption', description: 'Public key and private key based secure comminication'}, {name: 'Digital signature', description: 'Dont protect data but verify the authenticity'}, {name: 'Symetric key base encryption', description: 'Both sender and receiver share the same key: DES, AES'}])


cse = Course.create(name: 'CSE', description: 'Money making job will be available', is_open: true)
Course.create(name: 'EEE', description: 'NOw it is back to its original position', is_open: true)
Course.create(name: 'Physics', description: 'Working to find out rules of nature', is_open: true)


Subject.all.each do |s|
  cse.course_subjects.create(subject: s)
end


manazirahsan = User.create(name: 'Manazir Ahsan', email: 'manazir.bd@gmail.com', password_digest: 'manna')
manna = User.create(name: 'Manna', email: 'manazirahsan.developer@gmail.com', password_digest: 'manna')
bador = User.create(name: 'Manazir Ahsan ( Manna )', email: 'manazir.ahsan@framgia.com', password_digest: 'manna')
mahmud = User.create(name: 'Md Mahmudur Rahman', email: 'md.mahmud.rahman@gmail.com', password_digest: 'manna')
noor = User.create(name: 'Noor Ahmed Biswas', email: 'noor.ahmed.biswas@gmail.com', password_digest: 'manna')


cse = Course.first
cse.user_courses.create(user: manazirahsan)
cse.user_courses.create(user: manna)
cse.user_courses.create(user: bador)
cse.user_courses.create(user: mahmud)
cse.user_courses.create(user: noor)


cse.subjects.each do |s|
  s.tasks.each do |t|
    CurrentCourseSubjectTask.create(course: cse, subject: s, task: t)
  end
end