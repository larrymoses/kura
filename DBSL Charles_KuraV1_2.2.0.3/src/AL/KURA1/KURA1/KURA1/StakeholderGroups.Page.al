#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80006 "Stakeholder Groups"
{
    PageType = List;
    SourceTable = "Stakeholder Group";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Object Type";"Object Type")
                {
                    ApplicationArea = Basic;
                }
                field("Object ID";"Object ID")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Sub-Groups";"No. of Sub-Groups")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Blocked?";"Blocked?")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
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
            action("Go To List")
            {
                ApplicationArea = Basic;
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                       RunReportOrPageLink;
                end;
            }
            action("Sub-Groups")
            {
                ApplicationArea = Basic;
                Image = Route;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Stakeholder Sub-Groups";
                RunPageLink = "Stakeholder Group"=field(Code);
            }
        }
    }

    local procedure RunReportOrPageLink()
    var
        AllObjWithCaption: Record AllObjWithCaption;
    begin
        if ("Object Type" = 0) or ("Object ID" = 0) then
          exit;
        if "Object Type" = AllObjWithCaption."object type"::Page then
          Page.Run("Object ID")
        else
          Report.Run("Object ID");
    end;
}

