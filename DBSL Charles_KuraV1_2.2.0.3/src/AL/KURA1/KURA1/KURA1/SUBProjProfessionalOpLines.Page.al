#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72787 "SUB Proj Professional Op Lines"
{
    PageType = ListPart;
    SourceTable = "Project Evaluation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Cause of Delay";"Cause of Delay")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("EOT Requested Days";"EOT Requested Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("EOT Recommended Days";"EOT Recommended Days")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Remarks";"Evaluation Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Original Project Starting Date";"Original Project Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Original Project Ending Date";"Original Project Ending Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Extension Period";"Requested Extension Period")
                {
                    ApplicationArea = Basic;
                }
                field("Extended Project End Date";"Extended Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Extension Period";"Approved Extension Period")
                {
                    ApplicationArea = Basic;
                }
                field("Revised Project End Date";"Revised Project End Date")
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
        RecommVisible:=false;
        CalcFields(Status);
        if Status=Status::Released then
          RecommVisible:=true;
    end;

    trigger OnAfterGetRecord()
    begin
        RecommVisible:=false;
        CalcFields(Status);
        if Status=Status::Released then
          RecommVisible:=true;
    end;

    trigger OnOpenPage()
    begin
        RecommVisible:=false;
        CalcFields(Status);
        if Status=Status::Released then
          RecommVisible:=true;
    end;

    var
        RecommVisible: Boolean;
}

