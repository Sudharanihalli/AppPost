import Swal from 'sweetalert2';


const showDeleteConfirmation = () => {
  Swal.fire({
    title: 'Are you sure?',
    text: 'You will not be able to recover this record!',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, delete it!',
  }).then((result) => {
    if (result.isConfirmed) {
      
      const deleteButton = document.getElementById('delete-button');
      deleteButton.click();
    }
  });
};

export { showDeleteConfirmation };
