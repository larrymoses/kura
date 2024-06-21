#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72592 "Project Road Constituencies"
{
    PageType = List;
    SourceTable = "Project Road Link Constituency";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Code";"Constituency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Name";"Constituency Name")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code";"Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name";"Region Name")
                {
                    ApplicationArea = Basic;
                }
                field("Appro Constituency Cost";"Appro Constituency Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approximate Cost per Constituency';
                }
                field("Actual Constituency Cost";"Actual Constituency Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Workplanned Length";"Workplanned Length")
                {
                    ApplicationArea = Basic;
                    Caption = 'Workplanned Length (KM)';
                }
                field("KeRRA Budget Code";"KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Budget Book ID";"Global Budget Book ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage()
    begin
        //TESTFIELD("Appro Constituency Cost");
    end;
}

