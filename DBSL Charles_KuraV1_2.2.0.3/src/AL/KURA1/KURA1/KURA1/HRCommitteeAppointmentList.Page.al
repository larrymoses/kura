#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69297 "HR Committee Appointment List"
{
    ApplicationArea = Basic;
    CardPageID = "HR Committee Appointment";
    Editable = false;
    PageType = List;
    SourceTable = "Commitee Appointment Voucher";
    SourceTableView = where("Document Type"=filter(Appointment));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Type ID";"Committee Type ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Original Appointment No.";"Original Appointment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Effective Date";"Appointment Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tenure End Date";"Tenure End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointing Authority";"Appointing Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Raised By";"Raised By")
                {
                    ApplicationArea = Basic;
                }
                field("Staff ID";"Staff ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Region;Region)
                {
                    ApplicationArea = Basic;
                }
                field("Branch/Centre";"Branch/Centre")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control26;Outlook)
            {
            }
            systempart(Control27;Notes)
            {
            }
            systempart(Control28;MyNotes)
            {
            }
            systempart(Control29;Links)
            {
            }
        }
    }

    actions
    {
    }
}

