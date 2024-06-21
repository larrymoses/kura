#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 90126 "Approved REQ Disposal List"
{
    Caption = 'Approved Disposal Requisition List';
    CardPageID = "Disposal Header";
    Editable = false;
    PageType = List;
    SourceTable = "Disposal Header";
    SourceTableView = where(Status = const(Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Plan"; Rec."Disposal Plan")
                {
                    ApplicationArea = Basic;
                }
                // field("Employee No";rec."Employee No")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Employee Name";"Employee Name")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
    }
}
