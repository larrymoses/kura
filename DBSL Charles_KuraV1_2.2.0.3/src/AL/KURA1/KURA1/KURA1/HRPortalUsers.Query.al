#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Query 50071 "HRPortalUsers"
{

    elements
    {
        dataitem(Employee;Employee)
        {
            column(No;"No.")
            {
            }
            column(First_Name;"First Name")
            {
            }
            column(Middle_Name;"Middle Name")
            {
            }
            column(Last_Name;"Last Name")
            {
            }
            column(ID_Number;"ID Number")
            {
            }
            column(ICT_Help_Desk_Admin;"ICT Help Desk Admin")
            {
            }
            column(Region;Region)
            {
            }
            column(Department_Code;"Department Code")
            {
            }
            column(Directorate_Code;"Directorate Code")
            {
            }
            column(Global_Dimension_2_Code;"Global Dimension 2 Code")
            {
            }
            column(Global_Dimension_1_Code;"Global Dimension 1 Code")
            {
            }
            column(Shortcut_Dimension_3;"Shortcut Dimension 3")
            {
            }
            column(Driver;"Driver?")
            {
            }
            column(Department_Name;"Department Name")
            {
            }
            column(Job_Title;"Job Title")
            {
            }
            column(Fleet_Admin;"Fleet Admin")
            {
            }
            dataitem(HRPortalUsers;HRPortalUsers)
            {
                DataItemLink = employeeNo=Employee."No.";
                column("code";"code")
                {
                }
                column(employeeNo;employeeNo)
                {
                }
                column(IdNo;IdNo)
                {
                }
                column(password;password)
                {
                }
                column(changedPassword;changedPassword)
                {
                }
                column(EmployeeUserID;EmployeeUserID)
                {
                }
                dataitem(Hr_Jobs_Applicants;"Hr Jobs Applicants")
                {
                    DataItemLink = "ID Number"=HRPortalUsers.IdNo;
                    column(fName;"First Name")
                    {
                    }
                    column(mName;"Middle Name")
                    {
                    }
                    column(lName;"Last Name")
                    {
                    }
                    column(id;"ID Number")
                    {
                    }
                }
            }
        }
    }
}

