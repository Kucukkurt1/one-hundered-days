import type { Metadata } from "next";
import "./globals.css";
import { SplashScreenProvider } from "@/components/layout/SplashScreenProvider";
import { Toaster } from "@/components/ui/toast-core";

export const metadata: Metadata = {
  title: "FinderDev",
  description: "Find developers, discover projects, and build amazing things together",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>
        <SplashScreenProvider>{children}</SplashScreenProvider>
        <Toaster />
      </body>
    </html>
  );
}

