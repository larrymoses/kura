#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72762 "Assigned PCOs"
{
    ApplicationArea = Basic;
    CardPageID = "Project Commencement Order";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Project Mobilization Header";
    SourceTableView = where(Posted=filter(false),
                            "Document Type"=filter("Order-To-Commence"),
                            "Assigned To"=filter(<>''));
    UsageCategory = Documents;

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
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID";"Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Staff Appointment Voucher No.";"Staff Appointment Voucher No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No.";"Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address";"Vendor Address")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address 2";"Vendor Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Post Code";"Vendor Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor City";"Vendor City")
                {
                    ApplicationArea = Basic;
                }
                field("Primary E-mail";"Primary E-mail")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date";"Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date";"Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name";"Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No.";"Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name";"Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date";"Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID";"Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID";"Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID";"Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime";"Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan ID";"Work Execution Plan ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetRange("Assigned To",UserId);
    end;

    trigger OnAfterGetRecord()
    begin
        SetRange("Assigned To",UserId);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Document Type":="Document Type"::"Order-To-Commence";
    end;

    trigger OnOpenPage()
    begin
        SetRange("Assigned To",UserId);
    end;
}

