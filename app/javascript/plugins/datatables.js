import "datatables.net-bs4";
import "datatables.net-buttons-bs4";
import "datatables.net-responsive-bs4";
import "datatables.net-select-bs4";

let jQuery = $(document).on('turbolinks:load', function(){
    $('#companyTable').DataTable({ "pageLength": 50 });
    $('#userTable').DataTable({ "pageLength": 50 });
    $('#dashboardsTable').DataTable({ "pageLength": 50 });
    $('#formationsTable').DataTable({ "pageLength": 50, "order": [0] });
    $('#resolutionsTable').DataTable({ "pageLength": 50, "order": [0] });
    $('#directorsTable').DataTable({ });
    $('#officersTable').DataTable({ });
    $("#advisorsTable").DataTable({ });
    $('#stockholdersTable').DataTable({ });
    $('#sharesTable').DataTable({ });
    $('#optionsTable').DataTable({ });
    $('#convertiblenotesTable').DataTable({ });
    $('#stockplansTable').DataTable({ });
    $('#optionplansTable').DataTable({ });
    $('#valuationsTable').DataTable({ });
    $('#ndasTable').DataTable({ });
    $('#contractsTable').DataTable({ });
    $('#domicilesTable').DataTable({ });
    $('#compliancesTable').DataTable({ });
    $('#taxesTable').DataTable({ });
    $('#formsTable').DataTable({ "pageLength": 50, "order": [0] });
    $('#peopleTable').DataTable({ });
    $('#usersTable').DataTable({ });
    $('#financesTable').DataTable({ });
    $('#employeesTable').DataTable({ });
    $('#optionholdersTable').DataTable({ });
});