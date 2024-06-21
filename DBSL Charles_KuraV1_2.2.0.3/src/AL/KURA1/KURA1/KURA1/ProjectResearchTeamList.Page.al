#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65040 "Project Research Team List"
{
    Caption = 'Project Research Team';
    CardPageID = "Project Research Team Card";
    Editable = false;
    PageType = List;
    SourceTable = "Project Research Team";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No";"Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Researcher ID";"Researcher ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Role";"Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field("Role Description";"Role Description")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Default Payment Mentod";"Default Payment Mentod")
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
            action("Copy From Grant Document")
            {
                ApplicationArea = Basic;
                Image = CopyDocument;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ContractLines.Reset;
                    ContractLines.SetRange("Project Contract No.","Job No");
                    if ContractLines.Find('-') then begin
                       repeat
                         GrantResearchTeam.Reset;
                         GrantResearchTeam.SetRange("Grant Opportunity ID",ContractLines."Grant ID");
                         if GrantResearchTeam.Find('-') then begin
                           repeat
                             Init;
                               "Job No":=ContractLines."Job No";
                               "Researcher ID":=GrantResearchTeam."Researcher ID";
                                Name:=GrantResearchTeam.Name;
                               "Primary Role":=GrantResearchTeam."Primary Role";
                               "Role Description":=GrantResearchTeam."Role Description";
                            Insert;
                           until GrantResearchTeam.Next=0;
                        end;
                       until ContractLines.Next=0;
                    end;
                    Message(Text0001);
                end;
            }
        }
    }

    var
        GrantResearchTeam: Record "Grant Research Team";
        ContractLines: Record "Contract Funding Lines";
        Text0001: label 'Project team copied successfully';
}

