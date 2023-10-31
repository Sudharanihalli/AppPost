
document.addEventListener("DOMContentLoaded", function () {
    const deleteButton = document.getElementById("delete-button");
  
    if (deleteButton) {
      deleteButton.addEventListener("ajax:beforeSend", function () {
        Swal.fire({
          title: "Delete Confirmation",
          text: "Are you sure you want to delete this post?",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#d33",
          cancelButtonColor: "#3085d6",
          confirmButtonText: "Yes, delete it!",
          cancelButtonText: "Cancel",
        }).then((result) => {
          if (result.isConfirmed) {
              this.closest("form").submit();
          } else {
            Swal.fire("Cancelled", "The post was not deleted.", "info");
          }
        });
      });
    }
  });
  