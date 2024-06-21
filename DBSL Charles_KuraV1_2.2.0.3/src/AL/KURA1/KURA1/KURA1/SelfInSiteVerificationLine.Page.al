#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72102 "Self In Site Verification Line"
{
    PageType = ListPart;
    SourceTable = "Self In Site Verification Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Service;Service)
                {
                    ApplicationArea = Basic;
                }
                field("Service Scope";"Service Scope")
                {
                    ApplicationArea = Basic;
                }
                field(Selection;Selection)
                {
                    ApplicationArea = Basic;
                }
                field("Service Criteria";"Service Criteria")
                {
                    ApplicationArea = Basic;
                }
                field("Total Complied(Km)";"Total Complied(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Non Complied(Km)";"Total Non Complied(Km)")
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

