// window.showChildTab = function ()  {
//   let eachChild = document.querySelectorAll(".dashboard-task-name")
//   eachChild.forEach(child => {
//     child.addEventListener('click', event => {
//       // const allActive = document.querySelectorAll(".active-task")
//       // allActive.forEach((activeTask) => {
//       //   activeTask.classList.remove("active-task")
//       // });
//       // event.target.classList.add('active-task');
//       const allDetails = document.querySelectorAll(".task-group")
//       allDetails.forEach((detailBox) => {
//         detailBox.classList.remove("show-task");
//       });
//       const taskDetails = document.querySelector(`.task-details[data-id="${event.currentTarget.dataset.id}"]`)

//       taskDetails.classList.add("show-task");
//     })
//   })
// }


// const showChildTab = window.showChildTab

const showChildTab = function() {
  let childNames = document.querySelectorAll(".each-child");
  let taskGroups = document.querySelectorAll(".task-group");
  childNames.forEach((childName) => {
    childName.addEventListener('click', (event) => {
      document.querySelectorAll(".selected-child").forEach(e => {
        e.classList.remove("selected-child");
      })
      console.log(childName);
      childName.classList.add('selected-child');
      const welcomeContent = document.getElementById('welcome-content');
      welcomeContent.classList.add('hidden');
      console.log(childName);

      let id = childName.dataset.id;
      let selectedTaskGroup = taskGroups.forEach((taskGroup) => {
        taskGroup.classList.add('hidden');
        if (taskGroup.dataset.id === id) {
          taskGroup.classList.remove('hidden');
        }
      });
    });
  });
}


export { showChildTab }
