#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69132 "Closed Interview Lines"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "Shortlisting Lines";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Employ;Employ)
                {
                    ApplicationArea = Basic;
                }
                field("Application No";"Application No")
                {
                    ApplicationArea = Basic;
                }
                field("Full Name";"Full Name")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Interview Location";"Interview Location")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Date";"Interview Date")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Time";"Interview Time")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Due Date";"Interview Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Written Interview Score";"Written Interview Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Apptitude Interview Score";"Apptitude Interview Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Oral Interview Score";"Oral Interview Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

