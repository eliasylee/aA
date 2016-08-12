function Student(fName, lName) {
  this.fName = fName;
  this.lName = lName;
  this.courses = [];
}

Student.prototype.name = function() {
  return `${this.fName} ${this.lName}`;
};

Student.prototype.enroll = function(course) {
  this.courses.push(course);
  course.addStudent(this);
};

Student.prototype.courseLoad = function() {
  //hash of dept and credits
  let load = new Object();
  this.courses.forEach((course) => (load[course.dept] = course.credits));
  return load;
};

function Course(name, dept, credits) {
  this.name = name;
  this.dept = dept;
  this.credits = credits;
  this.students = [];
}

Course.prototype.addStudent = function(student) {
  this.students.push(student.name());
};

let student1 = new Student("harry", "potter");
let course1 = new Course("spells 101", "magic", 5);

student1.enroll(course1);
console.log(student1.courseLoad());
console.log(course1.students);
