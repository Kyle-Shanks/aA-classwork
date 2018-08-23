function Student(fname, lname) {
  this.fname = fname;
  this.lname = lname;
  this.courses = [];
}

Student.prototype.name = function() {
  return `${this.fname} ${this.lname}`;
};

Student.prototype.enroll = function(course) {
  let conflict = this.hasConflict(course);
  if (conflict) {
    throw `Conflicts with ${conflict.name}`;
  }
  this.courses.push(course);
  course.addStudent(this);
  return this.courses;
};

Student.prototype.courseLoad = function() {
  let courseObj = {};
  this.courses.forEach(function(c) {
    if(courseObj[c.dept]) {
      courseObj[c.dept] += c.credits;
    } else {
      courseObj[c.dept] = c.credits;
    }
  });
  return courseObj;
};

Student.prototype.hasConflict = function(course) {
  this.courses.forEach(function(c) {
    if(c.conflictsWith(course)) {
      return c;
    }
  });
};

function Course(name, dept, credits, days, timeblock) {
  this.name = name;
  this.dept = dept;
  this.credits = Number(credits);
  this.days = days;
  this.timeblock = timeblock;
  this.students = [];
}

Course.prototype.addStudent = function(student) {
  this.students.push(student);
  return this.students;
};

Course.prototype.conflictsWith = function(course) {
  if(course.timeblock !== this.timeblock) { return false; }
  return this.days.filter((day) => {return course.days.includes(day);}).length !== 0;
};
