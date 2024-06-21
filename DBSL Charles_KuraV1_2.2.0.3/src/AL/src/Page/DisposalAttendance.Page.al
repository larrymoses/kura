#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 70147 "Disposal Attendance"
{
    PageType = List;
    SourceTable = "External Supplier Voucher Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field(Name;Name)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Email;Email)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Tel No";"Tel No")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Designation;Designation)
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
            }
            systempart(Control10; Notes)
            {
            }
            systempart(Control11; MyNotes)
            {
            }
            systempart(Control12; Links)
            {
            }
        }
    }

    actions
    {
    }
}
