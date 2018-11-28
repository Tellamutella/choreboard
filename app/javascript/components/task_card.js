

// const tasks = document.querySelectorAll(".dashboard-task-name");
// tasks.forEach(task => {
//     task.addEventListener('click', event => {
//         event.target.nextElementSibling.classList.toggle("visible-dashboard-task-details");
//         event.target.classList.toggle("active-task");
//     })
// })

// let taskDetails = document.getElementsByClassName('dashboard-task-details');

// console.log(taskDetails)

// let displayBlock = function(i) {
//     taskDetails[i].style.display = "block";
// };


// for (let i = 0; i < eachTask.length; i++) {
//     eachTask[i].onclick = function(event) {
//         displayBlock(Array.from(eachTask).indexOf(event.target))
//     };
// }

window.findTaskDetails = function ()  {
  let eachTask = document.querySelectorAll(".dashboard-task-name")
  eachTask.forEach(task => {
    task.addEventListener('click', event => {
      const allDetails = document.querySelectorAll(".task-details")
      allDetails.forEach((detailBox) => {
        detailBox.classList.remove("show-task");
      });
      const taskDetails = document.querySelector(`.task-details[data-id="${event.currentTarget.dataset.id}"]`)

      taskDetails.classList.add("show-task");
    })
  })
}


const findTaskDetails = window.findTaskDetails


export { findTaskDetails }
// let closes = document.querySelectorAll(".close")

// let closeModal = function(i) {
//     modal[i].style.display = "none";
// };

// for (let i = 0; i < closes.length; i++) {
//     closes[i].onclick = function(event) {
//         closeModal(Array.from(closes).indexOf(event.target))
//     };
// }
