#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69753 "Background Checks Reference"
{
    PageType = ListPart;
    SourceTable = "Background Checks Reference";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Referee Id";"Referee Id")
                {
                    ApplicationArea = Basic;
                }
                field("Referee Type";"Referee Type")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer";"Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Invited for Detailed Recommend";"Invited for Detailed Recommend")
                {
                    ApplicationArea = Basic;
                }
                field("Invited On";"Invited On")
                {
                    ApplicationArea = Basic;
                }
                field("Referee Recomm Report ID";"Referee Recomm Report ID")
                {
                    ApplicationArea = Basic;
                }
                field("Recommended for Hire";"Recommended for Hire")
                {
                    ApplicationArea = Basic;
                }
                field("Title/Designation";"Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field(Institution;Institution)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Invite for Recomendation")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Invite the referee %1 to give recommendation?';
                begin
                    if Confirm(TXT001,true,Name)=true then begin
                      Recruitment.NotifyReferee(Rec);
                    end
                end;
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
}

