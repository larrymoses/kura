#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57183 "Salary Advance List"
{
    CardPageID = "Salary Advance Card";
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type"=filter("Salary Advance"),
                            Status=filter(Open|"Pending Approval"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name";"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Advance";"Salary Advance")
                {
                    ApplicationArea = Basic;
                }
                field("No of months deducted";"No of months deducted")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Installment";"Monthly Installment")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12;Notes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Payment Type" := "payment type"::"Salary Advance";
        "Document Type":="document type"::"Salary Advance";
        /*
        Date := TODAY;
        "Created By" := USERID;
        "Account Type" := "Account Type"::Customer;
        */

    end;

    var
        Usersetup: Record "User Setup";
        Employee: Record Employee;
}

