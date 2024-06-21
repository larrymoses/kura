#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69159 "Training Needs Disapproved"
{
    Caption = 'Training Needs Disapproved';
    CardPageID = "Training Needs Card p";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Advertisement Channels";
    SourceTableView = sorting(Code)
                      where(jj = const('2'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                //             field(Mode;Mode)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Need Source";"Need Source")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field(Qualification;Qualification)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field(Description;Description)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("End Date";"End Date")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Duration Units";"Duration Units")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field(Duration;Duration)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field(Source;Source)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field(Provider;Provider)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Cost Of Training";"Cost Of Training")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //         }
                //     }
                //     area(factboxes)
                //     {
                //         systempart(Control1000000014;Notes)
                //         {
                //         }
                //         systempart(Control1000000015;MyNotes)
                //         {
                //         }
                //         systempart(Control1000000016;Links)
                //         {
                //         }
                //     }
                // }

                // actions
                // {
                // }
            }
        }
#pragma warning disable AL0198
    }
#pragma warning restore AL0198
}