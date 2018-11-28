import "bootstrap";


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


