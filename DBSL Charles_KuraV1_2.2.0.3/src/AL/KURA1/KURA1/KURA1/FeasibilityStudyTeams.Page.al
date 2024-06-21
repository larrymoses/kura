#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72055 "Feasibility Study Teams"
{
    PageType = List;
    SourceTable = "Feasibility Study  Members";

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
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Lead";"Project Lead")
                {
                    ApplicationArea = Basic;
                    Caption = 'Study Lead';
                }
            }
        }
    }

    actions
    {
    }

    var
        [InDataSet]
        Show: Boolean;
        editTransport: Boolean;
        ApprovalEntry: Record "Approval Entry";
        ImprestMemo: Record "Imprest Memo";
        EditDays: Boolean;
}

