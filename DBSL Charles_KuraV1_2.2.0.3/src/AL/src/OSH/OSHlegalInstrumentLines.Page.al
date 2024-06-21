#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69446 "OSH legal Instrument Lines"
{
    PageType = ListPart;
    SourceTable = 69422;

    layout
    {
        area(content)
        {
            field("Legal Instrument ID"; "Legal Instrument ID")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Line No."; "Line No.")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field(Description; Description)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}