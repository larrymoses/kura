#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65029 "GFO Approval Comm Entry List"
{
    CardPageID = "GFO Approval Entry Card";
    Editable = false;
    PageType = List;
    SourceTable = "GFO Approval Committee Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("RAC ID";"RAC ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Funding Application Id";"Grant Funding Application Id")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Funding Application Id';
                }
                field("Final Approval Verdict";"Final Approval Verdict")
                {
                    ApplicationArea = Basic;
                }
                field("Final Approval Date";"Final Approval Date")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No";"External Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

