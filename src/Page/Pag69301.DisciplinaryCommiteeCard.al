#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69301 "Disciplinary Commitee Card"
{
    PageType = Card;
    SourceTable = "Disciplinary Committees";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Non-Employee";"Non-Employee")
                {
                    ApplicationArea = Basic;
                    trigger OnValidate()
                    begin
                        EnableControls();
                    end;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Mandate;Mandate)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control10;"Disciplinary Committee Members")
            {
                Visible = Employee;
                Caption = 'Disciplinary Committee Members';
                SubPageLink = Committee=field(Code);
            }
            part(Control11; "Disciplinary Committee ListP")
            {
                Visible = not Employee;
                Caption = 'Disciplinary Committee Members';
                SubPageLink = "Document No." = field(Code);
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        EnableControls();
    end;

    var
        Employee: Boolean;

    /// <summary>
    /// EnableControls.
    /// </summary>
    procedure EnableControls()
    begin
        Employee:= Rec.IsEmployee();
    end;
}

