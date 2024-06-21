#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65009 "Research Program Card"
{
    PageType = Card;
    SourceTable = "Research Program";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2";"Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code";"Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code";"Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                group("Program Overview Info")
                {
                    Caption = 'Program Overview Info';
                    field("Program Overview";WorkDescription)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Program Overview';
                        MultiLine = true;

                        trigger OnValidate()
                        begin
                            SetWorkDescription(WorkDescription);
                        end;
                    }
                }
                field("Program Director";"Program Director")
                {
                    ApplicationArea = Basic;
                }
                field("Program Director Name";"Program Director Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Contact;Contact)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Fax No.";"Fax No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail";"E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Home Page";"Home Page")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control30;"Research Program Factbox")
            {
                SubPageLink = Code=field(Code);
            }
            systempart(Control29;Links)
            {
                Visible = false;
            }
            systempart(Control28;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Resp. Ctr.")
            {
                Caption = '&Resp. Ctr.';
                Image = Dimensions;
                action("Copy Company Address")
                {
                    ApplicationArea = Basic;
                    Image = Copy;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Code='' then
                          Error(Text0001,Code);
                          CompInfo.Get();
                           Address:=CompInfo.Address;
                           "Address 2":=CompInfo."Address 2";
                           "Post Code":=CompInfo."Post Code";
                           City:=CompInfo.City;
                           "Country/Region Code":=CompInfo."Country/Region Code";
                           Modify;

                         Message(Text0002);
                    end;
                }
                action("Grants Profile")
                {
                    ApplicationArea = Basic;
                    Image = Grid;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Grant Funding Application List";
                    RunPageLink = "Primary Research Program ID"=field(Code);
                }
                action("Project Profile")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job List";
                    RunPageLink = "Research Program"=field(Code);
                }
                action("Project Areas")
                {
                    ApplicationArea = Basic;
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Research Project Area List";
                    RunPageLink = "Research Program ID"=field(Code);
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Research Program Statistics";
                }
                action("Research Centers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Research Centers';
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Research Center Programs List";
                    RunPageLink = "Program Code"=field(Code);
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        WorkDescription := GetWorkDescription;
    end;

    var
        Text0001: label 'Research Code %1 should not be blank';
        Text0002: label 'Details updated successfully';
        CompInfo: Record "Company Information";
        WorkDescription: Text;
}

