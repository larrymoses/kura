#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80208 "Employee Attestations Card"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Employee Policy Attestation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Attestation No.";"Attestation No.")
                {
                    ApplicationArea = Basic;
                }
                field("Policy No.";"Policy No.")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Name";"Policy Name")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No";"External Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Goal";"Policy Goal")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No.";"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate";"Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department";"Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Acknowledge Policy")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if "Employee Signing Status"<>"employee signing status"::Approved then begin
                    "Employee Signing Status":="employee signing status"::Approved;
                    "Date Approved":=Today;
                    Modify;
                    Message('Acknowledgement Recorded Successfully');
                    end else
                    Error('Employee Signing Status must be Pending');
                end;
            }
        }
    }
}

