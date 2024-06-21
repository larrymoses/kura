#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72614 "Final Account Lines"
{
    PageType = ListPart;
    SourceTable = "Final Account Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Response Type";"Response Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Status';
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

