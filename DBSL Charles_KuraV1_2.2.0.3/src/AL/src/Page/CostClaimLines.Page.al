#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72707 "Cost Claim Lines"
{
    PageType = ListPart;
    SourceTable = "Cost Claim Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Cause of Overrun";"Cause of Overrun")
                {
                    ApplicationArea = Basic;
                }
                field("Cost Claim Requested Amount";"Cost Claim Requested Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Cost Claim Approved Amount";"Cost Claim Approved Amount")
                {
                    ApplicationArea = Basic;
                    Visible = apprvisible;
                }
                field(Status;Status)
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
        apprvisible:=false;
        CalcFields(Status);
        if Status=Status::Released then
          apprvisible:=true;
    end;

    trigger OnAfterGetRecord()
    begin
        apprvisible:=false;
        CalcFields(Status);
        if Status=Status::Released then
          apprvisible:=true;
    end;

    trigger OnOpenPage()
    begin
        apprvisible:=false;
        CalcFields(Status);
        if Status=Status::Released then
          apprvisible:=true;
    end;

    var
        apprvisible: Boolean;
}

