#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69087 "Manager Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Job Cue";

    layout
    {
        area(content)
        {
            cuegroup(Employees)
            {
                Caption = 'Employees';
            }
            cuegroup("Service Contracts")
            {
                Caption = 'Service Contracts';

                actions
                {
                    action("New Service Contract")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Service Contract';
                        RunObject = Page "Service Contract";
                        RunPageMode = Create;
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Reset;
        if not Get then begin
          Init;
          Insert;
        end;

        SetFilter("Date Filter",'>=%1',WorkDate);
    end;
}

