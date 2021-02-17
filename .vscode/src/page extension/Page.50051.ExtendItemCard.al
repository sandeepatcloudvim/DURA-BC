pageextension 50051 Extend_ItemCard_30 extends "Item Card"
{
    layout
    {
        modify("Item Category Code")
        {
            ApplicationArea = All;
            ShowMandatory = true;
        }
        addafter(Warehouse)
        {
            group(BagProperties)
            {
                Caption = 'Bag Properties';

                field("Bag Style"; Rec."Bag Style")
                {
                    ApplicationArea = All;
                }
                field("Film Structure"; Rec."Film Structure")
                {
                    ApplicationArea = All;
                }
                field(Color; Rec.Color)
                {
                    ApplicationArea = All;
                }
                field("Gusset Style"; Rec."Gusset Style")
                {
                    ApplicationArea = All;
                }
                field("Barrier Level"; Rec."Barrier Level")
                {
                    ApplicationArea = All;
                }
                field(Zipper; Rec.Zipper)
                {
                    ApplicationArea = All;
                }
                field("Hang Hole"; Rec."Hang Hole")
                {
                    ApplicationArea = All;
                }
                field(Window; Rec.Window)
                {
                    ApplicationArea = All;
                }
                field("Fill Style"; Rec."Fill Style")
                {
                    ApplicationArea = All;
                }
                field("Bag Width"; Rec."Bag Width")
                {
                    ApplicationArea = All;
                }
                field("Bag Length"; Rec."Bag Length")
                {
                    ApplicationArea = All;
                }
                field("Bag Gusset"; Rec."Bag Gusset")
                {
                    ApplicationArea = All;
                }
                field("Bag Volume"; Rec."Bag Volume")
                {
                    ApplicationArea = All;
                }
                field("Bag Weight"; Rec."Bag Weight")
                {
                    ApplicationArea = All;
                }
                field("Bag Thickness"; Rec."Bag Thickness")
                {
                    ApplicationArea = All;
                }
                field("Bag Tear Noth"; Rec."Bag Tear Notch")
                {
                    ApplicationArea = All;
                    Caption = 'Bag Tear Notch';
                }

            }

        }
    }

    actions
    {
        addafter(Attributes)
        {
            action("Assign Item No")
            {
                ApplicationArea = All;
                Caption = 'Assign Item No.';
                Image = Item;
                Promoted = true;
                PromotedCategory = Process;
                Ellipsis = true;

                trigger OnAction()
                begin
                    Rec.AssignItemNo(Rec."No.");
                    CurrPage.Update();
                end;
            }
        }
    }

    var
        myInt: Integer;


}