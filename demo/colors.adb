
-- Simple Lumen demo/test program, using earliest incomplete library
--
-- Build with: gnatmake colors

with Lumen.Window;
with Lumen.Events;
with GL;

procedure Colors is

   Win     : Lumen.Window.Handle;
   Event   : Lumen.Events.Event_Data;
   Visible : Boolean := False;

begin  -- Colors

   -- Create Lumen window, accepting most defaults; turn double buffering off
   -- for simplicity
   Win := Lumen.Window.Create (Name => "Ooh, Colors!", Animated => False,
                               Events => (Lumen.Window.Want_Key_Press => True, others => False));

   -- Loop until user hits a key or clicks the window's Close button
   Outer: Loop

      -- Process events if there are any pending
      while Lumen.Events.Pending (Win) > 0 loop
         declare
            use type Lumen.Events.Event_Type;
         begin
            Event := Lumen.Events.Next_Event (Win);

            -- Exit when they destroy the window, or when they hit any key
            exit Outer when Event.Which = Lumen.Events.Key_Press or Event.Which = Lumen.Events.Close_Window;

            -- Note that the window is now visible, once it actually is
            if Event.Which = Lumen.Events.Mapped and not Visible then
               Visible := True;
            end if;
         end;
      end loop;

      -- Do our drawing
      if Visible then
         declare
            use GL;
         begin
            -- Red
            glClearColor (1.0, 0.0, 0.0, 1.0);
            glClear (GL_COLOR_BUFFER_BIT);
            glFlush;
            delay 1.0;

            -- Green
            glClearColor (0.0, 1.0, 0.0, 1.0);
            glClear (GL_COLOR_BUFFER_BIT);
            glFlush;
            delay 1.0;

            -- Blue
            glClearColor (0.0, 0.0, 1.0, 1.0);
            glClear (GL_COLOR_BUFFER_BIT);
            glFlush;
            delay 1.0;
         end;
      end if;
   end loop Outer;

end Colors;