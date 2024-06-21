#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Query 55031 "HelpDeskAssignee"
{

    elements
    {
        dataitem(User_Setup;"User Setup")
        {
            column(Employee_No;"Employee No.")
            {
            }
            dataitem(ICT_Officers_Category_Mapping;"ICT Officers Category Mapping")
            {
                DataItemLink = UserName=User_Setup."User ID";
                column(UserName;UserName)
                {
                }
                column(Help_Desk_Category;"Help Desk Category")
                {
                }
                column(Region_Code;"Region Code")
                {
                }
                column(Region_Name;"Region Name")
                {
                }
                column(User_Feedbback_Duration;"User Feedbback Duration")
                {
                }
                column(Assined_Issue_Duration;"Assined Issue Duration")
                {
                }
                column(Assigned;Assigned)
                {
                }
            }
        }
    }
}

