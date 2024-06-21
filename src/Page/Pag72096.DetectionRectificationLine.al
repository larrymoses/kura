#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72096 "Detection & Rectification Line"
{
    PageType = ListPart;
    SourceTable = "Detection & Rectification Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Date Detected";"Date Detected")
                {
                    ApplicationArea = Basic;
                }
                field("Location Deteced From";"Location Deteced From")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Date Rectified";"Date Rectified")
                {
                    ApplicationArea = Basic;
                }
                field("Complied?";"Complied?")
                {
                    ApplicationArea = Basic;
                }
                field(Remark;Remark)
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

