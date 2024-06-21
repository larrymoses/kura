#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50092 "pageextension50092" extends "Employee Card"
{
    layout
    {

        modify(Control13)
        {
            Visible = false;
        }

        modify(Payments)
        {
            Visible = false;
        }
        modify("Birth Date")
        {
            Visible = false;
        }
        addafter("Phone No.2")
        {
            field(Disabled; Rec.Disabled)
            {
                ApplicationArea = Basic;
            }


        }

        addafter("Last Date Modified")
        {
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = Basic;
            }
            field("Directorate Head"; Rec."Directorate Head")
            {
                ApplicationArea = Basic;
            }
            field("Employee Category"; Rec."Employee Category")
            {

            }
            field("Employement Terms"; Rec."Employement Terms")
            {

            }
        }
        addfirst("Address & Contact")
        {
            group(Control1367)
            {
            }
        }
        addafter("Salespers./Purch. Code")
        {
            field("Research Center"; Rec."Research Center")
            {
                ApplicationArea = Basic;
            }
        }
        addfirst(Personal)
        {
            field("Date Of Birth"; Rec."Date Of Birth")
            {
                ApplicationArea = Basic;
                ToolTip = 'Enter the date of birth here to calculate retirement date';
            }

        }
        addlast(Administration)
        {
            field("Contract End Date"; Rec."Contract End Date")
            {

            }
        }
    }
    actions
    {
        addlast("E&mployee")
        {
            action("Change Position")
            {
                ApplicationArea = BasicHR;
                Enabled = true;
                Image = Change;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    Emp: record Employee;
                    ChangePosition: report "Change Employee Position";
                begin
                    Emp.Reset();
                    Emp.SetRange("No.",Rec."No.");
                    ChangePosition.SetTableView(Emp);
                    ChangePosition.RunModal;
                end;
            }
            action("Employee History")
            {
                ApplicationArea = BasicHR;
                Enabled = true;
                Image = History;
                Promoted = true;
                PromotedCategory = Process;
                RunObject =Page "Employee History";
                RunPageLink = "Employee No."=field("No.");
            }
        }
        addafter(PayEmployee)
        {
            action("Create Customer Imprest A/C")
            {
                ApplicationArea = BasicHR;
                Enabled = true;
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Cust: Record Customer;
                begin
                    if Rec.CreateCustomer then
                        Message(Text000, 'Imprest A/C')
                    else
                        Message(Text001, 'Imprest A/C');
                end;
            }
            action("Create Resource A/C")
            {
                ApplicationArea = Basic;
                Enabled = true;
                Image = Resource;
                Promoted = true;
                Visible = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.CreateResource then
                        Message(Text000, 'Resource')
                    else
                        Message(Text001, 'Resource');
                end;
            }
        }
    }


    //Unsupported feature: Property Modification (Id) on "FormatAddress(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //FormatAddress : 1003;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FormatAddress : 1553;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "IsCountyVisible(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //IsCountyVisible : 1002;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IsCountyVisible : 1552;
    //Variable type has not been exported.

    var
        [InDataSet]
        ShowCust: Boolean;
        [InDataSet]
        ShowResource: Boolean;
        Text000: label '%1 has been created successully';
        Text001: label '%1 already exists';
}

#pragma implicitwith restore

